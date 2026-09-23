import { useState } from "react";
import { axiosClient } from "../api/axiosClient";

export default function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    setLoading(true);

    try {
      const res = await axiosClient.post("/login", { email, password });

      // res.data = { accessToken, user: { email, id } }
      const { accessToken, user } = res.data;

      // Guardar token (y opcionalmente el usuario)
      localStorage.setItem("accessToken", accessToken);
      localStorage.setItem("user", JSON.stringify(user));

      // Ejemplo: redireccionar o marcar estado de autenticación
      // navigate("/dashboard");

      alert(`Login OK. Bienvenido ${user.email}`);
      window.location.href = "/"; // simple y efectivo  
    } catch (err) {
      // Manejo típico de error Axios
      const msg =
        err?.response?.data?.message ||
        err?.response?.statusText ||
        err?.message ||
        "Error desconocido";
      setError(msg);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="login">
      <h2>Login</h2>

      <form onSubmit={handleSubmit}>
        <label>Email</label>
        <input
          className="login__input"
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          autoComplete="email"
        />

        <label>Password</label>
        <input
          className="login__input"
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          autoComplete="current-password"
        />

        {error ? (
          <div className="login__error">{error}</div>
        ) : null}

        <button disabled={loading} type="submit" className="login__button">
          {loading ? "Entrando..." : "Entrar"}
        </button>
      </form>
    </div>
  );
}