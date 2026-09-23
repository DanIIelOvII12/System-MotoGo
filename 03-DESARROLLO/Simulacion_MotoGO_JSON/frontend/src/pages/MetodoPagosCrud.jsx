import { useState, useEffect } from "react";
import { metodoPagos } from "../api/metodoPagos";

export default function MetodoPagosCrud() {
  const [items, setItems] = useState([]);
  const [loading, setLoading] = useState(false);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingId, setEditingId] = useState(null);
  
  // Estado para el formulario
  const [formData, setFormData] = useState({
    nombre: "",
  });

  // Cargar registros al montar el componente
  useEffect(() => {
    fetchMetodos();
  }, []);

  const fetchMetodos = async () => {
    setLoading(true);
    try {
      const response = await metodoPagos.list();
      setItems(response.data);
    } catch (error) {
      console.error("Error al cargar los métodos de pago:", error);
    } finally {
      setLoading(false);
    }
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
  };

  const handleOpenModal = (item = null) => {
    if (item) {
      setEditingId(item.id);
      setFormData({ nombre: item.nombre });
    } else {
      setEditingId(null);
      setFormData({ nombre: "" });
    }
    setIsModalOpen(true);
  };

  const handleCloseModal = () => {
    setIsModalOpen(false);
    setEditingId(null);
    setFormData({ nombre: "" });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      if (editingId) {
        await metodoPagos.update(editingId, formData);
      } else {
        await metodoPagos.create(formData);
      }
      fetchMetodos();
      handleCloseModal();
    } catch (error) {
      console.error("Error al guardar el método de pago:", error);
    }
  };

  const handleDelete = async (id) => {
    if (window.confirm("¿Deseas eliminar este método de pago?")) {
      try {
        await metodoPagos.remove(id);
        fetchMetodos();
      } catch (error) {
        console.error("Error al eliminar el método de pago:", error);
      }
    }
  };

  return (
    <div className="payment-page">
      <h2>Gestión de Métodos de Pago</h2>

      <button onClick={() => handleOpenModal()} className="payment-add-button">
        + Agregar Método de Pago
      </button>

      {loading ? (
        <p>Cargando métodos de pago...</p>
      ) : (
        <table border="1" cellPadding="8" cellSpacing="0" className="payment-table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Nombre</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {items.map((item) => (
              <tr key={item.id}>
                <td>{item.id}</td>
                <td>{item.nombre}</td>
                <td>
                  <button onClick={() => handleOpenModal(item)}>Editar</button>{" "}
                  <button onClick={() => handleDelete(item.id)}>Eliminar</button>
                </td>
              </tr>
            ))}
            {items.length === 0 && (
              <tr>
                <td colSpan="3" className="payment-empty">
                  No hay métodos de pago registrados.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      )}

      {/* Modal Formulario */}
      {isModalOpen && (
        <div className="payment-modal-overlay">
          <div className="payment-modal">
            <h3>{editingId ? "Editar Método de Pago" : "Nuevo Método de Pago"}</h3>
            <form onSubmit={handleSubmit}>
              <div className="payment-field">
                <label className="payment-label">Nombre:</label>
                <input
                  type="text"
                  name="nombre"
                  value={formData.nombre}
                  onChange={handleInputChange}
                  required
                  className="payment-input"
                />
              </div>
              <div className="payment-modal-actions">
                <button type="button" onClick={handleCloseModal}>
                  Cancelar
                </button>
                <button type="submit">Guardar</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
