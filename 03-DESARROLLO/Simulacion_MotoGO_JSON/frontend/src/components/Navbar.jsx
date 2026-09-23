import { NavLink } from "react-router-dom";
import ".//Navbar.css";

const linkClassName = ({ isActive }) => `navbar__link${isActive ? " navbar__link--active" : ""}`;

export default function Navbar() {
  const token = localStorage.getItem("accessToken");
  const user = JSON.parse(localStorage.getItem("user"));

  const logout = () => {
    localStorage.removeItem("accessToken");
    localStorage.removeItem("user");
    window.location.href = "/"; // simple y efectivo
  };

  return (
    <nav className="navbar">
      <div className="navbar__links">
        <strong>MotoGO</strong>

        
        {!token ?(
          <>
          <NavLink to="/login" className={linkClassName}>
          Login
        </NavLink>
        <NavLink to="/register" className={linkClassName}>
          Registro
        </NavLink>
        </>
        ): null}
        {token ? (
          <>
            <NavLink to="/tipo-documentos" className={linkClassName}>
              Tipo Documentos
            </NavLink>
            <NavLink to="/usuarios" className={linkClassName}>
              Usuarios
            </NavLink>
            <NavLink to="/categoria-productos" className={linkClassName}>
              Categoria Productos
            </NavLink>
            <NavLink to="/tipo-vehiculos" className={linkClassName}>
              Tipo Vehiculos
            </NavLink>
            <NavLink to="/metodo-pagos" className={linkClassName}>
              Metodo Pagos
            </NavLink>
          </>
        ) : null}
      </div>

      <div className="navbar__account">
        <span className="navbar__status">
          {token ? "Autenticado" : "No autenticado"}
          {user ? ` (${user.email})` : ""}
        </span>
        {token ? (
          <button onClick={logout} className="navbar__logout">
            Salir
          </button>
        ) : null}
      </div>
    </nav>
  );
}