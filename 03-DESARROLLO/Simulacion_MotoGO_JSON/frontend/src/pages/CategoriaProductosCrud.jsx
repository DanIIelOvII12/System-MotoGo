import { useEffect, useMemo, useState } from "react";
import { categoriaProductos } from "../api/categoriaProductos";

const emptyForm = {
  nombre: "",
  descripcion: "",
};

export default function CategoriaProductosCrud() {
  const [items, setItems] = useState([]);
  const [loadingList, setLoadingList] = useState(false);

  const [form, setForm] = useState(emptyForm);
  const [saving, setSaving] = useState(false);

  const [editingId, setEditingId] = useState(null);
  const isEditing = useMemo(
    () => editingId !== null,
    [editingId]
  );

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
      const res = await categoriaProductos.list();
      setItems(res.data);
    } catch (err) {
      setError(
        err?.response?.statusText ||
          err?.message ||
          "Error listando categorías de productos"
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
    const { name, value } = e.target;

    setForm((f) => ({
      ...f,
      [name]: value,
    }));
  };

  // =========================
  // NUEVO
  // =========================
  const startCreate = () => {
    setEditingId(null);
    setForm(emptyForm);
    setError("");
    setSearchResult(null);
  };

  // =========================
  // EDITAR
  // =========================
  const startEdit = (item) => {
    setEditingId(item.id);

    setForm({
      nombre: item.nombre ?? "",
      descripcion: item.descripcion ?? "",
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

    if (!form.descripcion.trim()) {
      setError("La descripción es obligatoria");
      return;
    }

    setSaving(true);

    try {
      const data = {
        nombre: form.nombre,
        descripcion: form.descripcion,
      };

      if (isEditing) {
        await categoriaProductos.update(editingId, data);
      } else {
        await categoriaProductos.create(data);
      }

      startCreate();
      await loadList();
    } catch (err) {
      const msg =
        err?.response?.data?.message ||
        err?.response?.statusText ||
        err?.message ||
        "Error guardando categoría de producto";

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
      `¿Eliminar categoría de producto con id=${id}?`
    );

    if (!ok) return;

    setError("");

    try {
      await categoriaProductos.remove(id);

      if (editingId === id) {
        startCreate();
      }

      await loadList();
    } catch (err) {
      const msg =
        err?.response?.data?.message ||
        err?.response?.statusText ||
        err?.message ||
        "Error eliminando categoría de producto";

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
      const res = await categoriaProductos.getById(id);
      setSearchResult(res.data);
    } catch (err) {
      const status = err?.response?.status;

      if (status === 404) {
        setError("Categoría no encontrada (404)");
      } else {
        setError(
          err?.response?.statusText ||
            err?.message ||
            "Error buscando categoría"
        );
      }
    } finally {
      setSearchLoading(false);
    }
  };

  return (
    <div className="page-container">
      <h2>CRUD - Categorías de Productos</h2>

      {/* =========================
          ERROR
      ========================= */}
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
            ? `Editar categoría (id=${editingId})`
            : "Crear nueva categoría"}
        </h3>

        <form onSubmit={submit} className="crud-form-grid crud-form-grid--two-fields">
          {/* NOMBRE */}
          <div>
            <label>Nombre</label>

            <input
              name="nombre"
              value={form.nombre}
              onChange={onChange}
              className="crud-field-input"
              placeholder="Cascos"
            />
          </div>

          {/* DESCRIPCIÓN */}
          <div>
            <label>Descripción</label>

            <input
              name="descripcion"
              value={form.descripcion}
              onChange={onChange}
              className="crud-field-input"
              placeholder="Cascos Nuevos"
            />
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
          Buscar categoría por ID
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
      <span>CATEGORÍA ENCONTRADA</span>

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
        <span>DESCRIPCIÓN</span>
        <strong>{searchResult.descripcion}</strong>
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
            Listado de categorías
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
                Descripción
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

                {/* DESCRIPCIÓN */}
                <td className="crud-table-cell">
                  {it.descripcion}
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
                <td colSpan={4} className="crud-empty">
                  Sin categorías registradas
                </td>
              </tr>
            ) : null}
          </tbody>
        </table>
      </div>
    </div>
  );
}
