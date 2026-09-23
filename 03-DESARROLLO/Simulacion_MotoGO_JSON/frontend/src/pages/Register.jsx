import { useState } from "react";
import { axiosClient } from "../api/axiosClient";

export default function Register() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    setLoading(true);

    try {
      // POST http://localhost:3000/register
      const res = await axiosClient.post("/register", { email, password });

      // res.data = { accessToken, user: { email, id } }
      const { accessToken, user } = res.data;

      localStorage.setItem("accessToken", accessToken);
      localStorage.setItem("user", JSON.stringify(user));

      alert(`Registro OK. Bienvenido ${user.email}`);
      // navigate("/dashboard"); // si usas react-router
      window.location.href = "/";
    } catch (err) {
      let msg =
        err ||
        "Error desconocido";
      if(err.response){
        if(err.response.data === "Email already exists") {
          setError("El usuario ya existe");
        } else {
          setError(msg);
        }
      }else{
        msg= err.message;
        setError(msg);
      }
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="register">
      <h2 className="register__title">Registro</h2>

      <form className="register__form" onSubmit={handleSubmit}>
        <label className="register__label">Email</label>
        <input
          className="register__input"
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          autoComplete="email"
        />

        <label className="register__label">Password</label>
        <input
          className="register__input"
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          autoComplete="new-password"
        />

        {error ? <div className="register__error">{error}</div> : null}

        <button className="register__button" disabled={loading} type="submit">
          {loading ? "Creando cuenta..." : "Crear cuenta"}
        </button>
      </form>
    </div>
  );
}