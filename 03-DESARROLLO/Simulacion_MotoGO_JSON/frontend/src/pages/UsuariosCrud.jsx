import { useEffect, useMemo, useState } from "react";
import { usuarios } from "../api/usuarios";

const emptyForm = {
  login: "",
  correo: "",
  constrasenia: "",
};

export default function UsuariosCrud() {
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
      const res = await usuarios.list();
      setItems(res.data);
    } catch (err) {
      setError(
        err?.response?.statusText ||
          err?.message ||
          "Error listando usuarios"
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
      login: item.login ?? "",
      correo: item.correo ?? "",
      constrasenia: item.constrasenia ?? "",
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

    if (!form.login.trim()) {
      setError("El login es obligatorio");
      return;
    }

    if (!form.correo.trim()) {
      setError("El correo es obligatorio");
      return;
    }

    if (!form.constrasenia.trim()) {
      setError("La contraseña es obligatoria");
      return;
    }

    setSaving(true);

    try {
      const data = {
        login: form.login,
        correo: form.correo,
        constrasenia: form.constrasenia,
      };

      if (isEditing) {
        await usuarios.update(editingId, data);
      } else {
        await usuarios.create(data);
      }

      startCreate();
      await loadList();
    } catch (err) {
      const msg =
        err?.response?.data?.message ||
        err?.response?.statusText ||
        err?.message ||
        "Error guardando usuario";

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
      `¿Eliminar usuario con id=${id}?`
    );

    if (!ok) return;

    setError("");

    try {
      await usuarios.remove(id);

      if (editingId === id) {
        startCreate();
      }

      await loadList();
    } catch (err) {
      const msg =
        err?.response?.data?.message ||
        err?.response?.statusText ||
        err?.message ||
        "Error eliminando usuario";

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
      const res = await usuarios.getById(id);
      setSearchResult(res.data);
    } catch (err) {
      const status = err?.response?.status;

      if (status === 404) {
        setError("Usuario no encontrado (404)");
      } else {
        setError(
          err?.response?.statusText ||
            err?.message ||
            "Error buscando usuario"
        );
      }
    } finally {
      setSearchLoading(false);
    }
  };

  return (
    <div className="page-container">
      <h2>CRUD - Usuarios</h2>

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
            ? `Editar usuario (id=${editingId})`
            : "Crear nuevo usuario"}
        </h3>

        <form onSubmit={submit} className="crud-form-grid crud-form-grid--users">
          {/* LOGIN */}
          <div>
            <label>Login</label>

            <input
              name="login"
              value={form.login}
              onChange={onChange}
              className="crud-field-input"
              placeholder="DanielOvi12"
            />
          </div>

          {/* CORREO */}
          <div>
            <label>Correo</label>

            <input
              type="email"
              name="correo"
              value={form.correo}
              onChange={onChange}
              className="crud-field-input"
              placeholder="correo@ejemplo.com"
            />
          </div>

          {/* CONTRASEÑA */}
          <div>
            <label>Contraseña</label>

            <input
              type="password"
              name="constrasenia"
              value={form.constrasenia}
              onChange={onChange}
              className="crud-field-input"
              placeholder="Contraseña"
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
          Buscar usuario por ID
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
      <span>USUARIO ENCONTRADO</span>

      <span className="search-result-id">
        ID #{searchResult.id}
      </span>
    </div>

    <div className="search-result-body">
      <div className="search-result-item">
        <span>LOGIN</span>
        <strong>{searchResult.login}</strong>
      </div>

      <div className="search-result-item">
        <span>CORREO</span>
        <strong>{searchResult.correo}</strong>
      </div>

      <div className="search-result-item">
        <span>CONTRASEÑA</span>
        <strong>{searchResult.constrasenia}</strong>
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
            Listado de usuarios
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
                Login
              </th>

              <th className="crud-table-header">
                Correo
              </th>

              <th className="crud-table-header">
                Contraseña
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

                {/* LOGIN */}
                <td className="crud-table-cell">
                  {it.login}
                </td>

                {/* CORREO */}
                <td className="crud-table-cell">
                  {it.correo}
                </td>

                {/* CONTRASEÑA */}
                <td className="crud-table-cell">
                  {"•".repeat(
                    it.constrasenia?.length || 0
                  )}
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
                  Sin usuarios registrados
                </td>
              </tr>
            ) : null}
          </tbody>
        </table>
      </div>
    </div>
  );
}
