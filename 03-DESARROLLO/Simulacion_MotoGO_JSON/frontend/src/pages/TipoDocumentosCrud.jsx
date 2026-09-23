
import { useEffect, useMemo, useState } from "react";
import { tipoDocumentos } from "../api/tipoDocumentos";

const emptyForm = {
  nombre: "",
  abreviatura: "",
  estado: true,
};

export default function TipoDocumentosCrud() {
  const [items, setItems] = useState([]);
  const [loadingList, setLoadingList] = useState(false);

  const [form, setForm] = useState(emptyForm);
  const [saving, setSaving] = useState(false);

  const [editingId, setEditingId] = useState(null);
  const isEditing = useMemo(() => editingId !== null, [editingId]);

  const [searchId, setSearchId] = useState("");
  const [searchResult, setSearchResult] = useState(null);
  const [searchLoading, setSearchLoading] = useState(false);

  const [error, setError] = useState("");

  // =========================
  // LISTAR
  // =========================
  const loadList = async () => {
    setError("");
    setLoadingList(true);

    try {
      const res = await tipoDocumentos.list();
      setItems(res.data);
    } catch (err) {
      setError(
        err?.response?.statusText ||
        err?.message ||
        "Error listando registros"
      );
    } finally {
      setLoadingList(false);
    }
  };

  useEffect(() => {
    loadList();
  }, []);

  // =========================
  // CAMBIAR CAMPOS
  // =========================
  const onChange = (e) => {
    const { name, value, type, checked } = e.target;

    setForm((f) => ({
      ...f,
      [name]: type === "checkbox" ? checked : value,
    }));
  };

  // =========================
  // NUEVO
  // =========================
  const startCreate = () => {
    setEditingId(null);
    setForm(emptyForm);
    setError("");
  };

  // =========================
  // EDITAR
  // =========================
  const startEdit = (item) => {
    setEditingId(item.id);

    setForm({
      nombre: item.nombre ?? "",
      abreviatura: item.abreviatura ?? "",
      estado: item.estado ?? true,
    });

    setError("");

    window.scrollTo({
      top: 0,
      behavior: "smooth",
    });
  };

  // =========================
  // CREAR / ACTUALIZAR
  // =========================
  const submit = async (e) => {
    e.preventDefault();
    setError("");

    if (!form.nombre.trim()) {
      setError("El nombre es obligatorio");
      return;
    }

    if (!form.abreviatura.trim()) {
      setError("La abreviatura es obligatoria");
      return;
    }

    setSaving(true);

    try {
      const data = {
        nombre: form.nombre,
        abreviatura: form.abreviatura,
        estado: form.estado,
      };

      if (isEditing) {
        await tipoDocumentos.update(editingId, data);
      } else {
        await tipoDocumentos.create(data);
      }

      startCreate();
      await loadList();

    } catch (err) {
      const msg =
        err?.response?.data?.message ||
        err?.response?.statusText ||
        err?.message ||
        "Error guardando";

      setError(msg);

    } finally {
      setSaving(false);
    }
  };

  // =========================
  // ELIMINAR
  // =========================
  const remove = async (id) => {
    const ok = window.confirm(
      `¿Eliminar registro con id=${id}?`
    );

    if (!ok) return;

    setError("");

    try {
      await tipoDocumentos.remove(id);

      if (editingId === id) {
        startCreate();
      }

      await loadList();

    } catch (err) {
      const msg =
        err?.response?.data?.message ||
        err?.response?.statusText ||
        err?.message ||
        "Error eliminando";

      setError(msg);
    }
  };

  // =========================
  // BUSCAR POR ID
  // =========================
  const searchById = async () => {
    setError("");
    setSearchResult(null);

    const id = searchId.trim();

    if (!id) {
      setError("Escribe un id para buscar");
      return;
    }

    setSearchLoading(true);

    try {
      const res = await tipoDocumentos.getById(id);
      setSearchResult(res.data);

    } catch (err) {
      const status = err?.response?.status;

      if (status === 404) {
        setError("No encontrado (404)");
      } else {
        setError(
          err?.response?.statusText ||
          err?.message ||
          "Error buscando"
        );
      }

    } finally {
      setSearchLoading(false);
    }
  };

  return (
    <div className="page-container">
      <h2>CRUD - Registros</h2>

      {/* ERROR */}
      {error ? (
        <div className="page-error">
          {error}
        </div>
      ) : null}

      {/* =========================
          CREAR / EDITAR
      ========================= */}
      <div className="crud-card">
        <h3 className="crud-card-title">
          {isEditing
            ? `Editar (id=${editingId})`
            : "Crear nuevo"}
        </h3>

        <form onSubmit={submit} className="crud-form-grid crud-form-grid--documents">
          {/* NOMBRE */}
          <div>
            <label>Nombre</label>

            <input
              name="nombre"
              value={form.nombre}
              onChange={onChange}
              className="crud-field-input"
              placeholder="Nombre"
            />
          </div>

          {/* ABREVIATURA */}
          <div>
            <label>Abreviatura</label>

            <input
              name="abreviatura"
              value={form.abreviatura}
              onChange={onChange}
              className="crud-field-input"
              placeholder="ABC"
            />
          </div>

          {/* ESTADO */}
          <div>
            <label>Estado</label>

            <select
              name="estado"
              value={form.estado ? "true" : "false"}
              onChange={(e) =>
                setForm((f) => ({
                  ...f,
                  estado: e.target.value === "true",
                }))
              }
              className="crud-field-input"
            >
              <option value="true">Activo</option>
              <option value="false">Inactivo</option>
            </select>
          </div>

          {/* BOTONES */}
          <div className="crud-actions">
            <button
              type="submit"
              disabled={saving}
              className="crud-button"
            >
              {saving
                ? "Guardando..."
                : isEditing
                ? "Actualizar"
                : "Crear"}
            </button>

            {isEditing ? (
              <button
                type="button"
                onClick={startCreate}
                className="crud-button"
              >
                Cancelar
              </button>
            ) : null}
          </div>
        </form>
      </div>

      {/* =========================
          BUSCAR POR ID
      ========================= */}
      <div className="crud-card">
        <h3 className="crud-card-title">
          Buscar por ID
        </h3>

        <div className="crud-search-row">
          <input
            value={searchId}
            onChange={(e) =>
              setSearchId(e.target.value)
            }
            placeholder="Ej: 1"
            className="crud-search-input"
          />

          <button
            onClick={searchById}
            disabled={searchLoading}
            className="crud-button"
          >
            {searchLoading
              ? "Buscando..."
              : "Buscar"}
          </button>
        </div>

        {searchResult ? (
  <div className="crud-search-result">
    <div className="search-result-header">
      <span>DOCUMENTO ENCONTRADO</span>

      <span className="search-result-id">
        ID #{searchResult.id}
      </span>
    </div>

    <div className="search-result-body">
      <div className="search-result-item">
        <span>NOMBRE</span>
        <strong>{searchResult.nombre}</strong>
      </div>

      <div className="search-result-item">
        <span>ABREVIATURA</span>
        <strong>{searchResult.abreviatura}</strong>
      </div>

      <div className="search-result-item">
        <span>ESTADO</span>
        <strong>{searchResult.estado}</strong>
      </div>

      <div className="search-result-item">
        <span>ID</span>
        <strong>{searchResult.id}</strong>
      </div>
    </div>
  </div>
) : null}
      </div>

      {/* =========================
          LISTADO
      ========================= */}
      <div className="crud-card">
        <div className="crud-list-header">
          <h3 className="crud-card-title">
            Listado
          </h3>

          <button
            onClick={loadList}
            disabled={loadingList}
            className="crud-button"
          >
            {loadingList
              ? "Cargando..."
              : "Refrescar"}
          </button>
        </div>

        {loadingList ? (
          <div>Cargando...</div>
        ) : null}

        <table className="crud-table">
          <thead>
            <tr>
              <th className="crud-table-header">
                ID
              </th>

              <th className="crud-table-header">
                Nombre
              </th>

              <th className="crud-table-header">
                Abreviatura
              </th>

              <th className="crud-table-header">
                Estado
              </th>

              <th className="crud-table-header--actions">
                Acciones
              </th>
            </tr>
          </thead>

          <tbody>
            {items.map((it) => (
              <tr key={it.id}>
                {/* ID */}
                <td className="crud-table-cell">
                  {it.id}
                </td>

                {/* NOMBRE */}
                <td className="crud-table-cell">
                  {it.nombre}
                </td>

                {/* ABREVIATURA */}
                <td className="crud-table-cell">
                  {it.abreviatura}
                </td>

                {/* ESTADO */}
                <td className="crud-table-cell">
                  {it.estado ? "Activo" : "Inactivo"}
                </td>

                {/* ACCIONES */}
                <td className="crud-table-cell">
                  <div className="crud-table-actions">
                    <button
                      onClick={() => startEdit(it)}
                      className="crud-table-action"
                    >
                      Editar
                    </button>

                    <button
                      onClick={() => remove(it.id)}
                      className="crud-table-action"
                    >
                      Eliminar
                    </button>
                  </div>
                </td>
              </tr>
            ))}

            {items.length === 0 ? (
              <tr>
                <td colSpan={5} className="crud-empty">
                  Sin registros
                </td>
              </tr>
            ) : null}
          </tbody>
        </table>
      </div>
    </div>
  );
}