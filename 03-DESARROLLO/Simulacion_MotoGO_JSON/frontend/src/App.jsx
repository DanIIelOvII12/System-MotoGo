import { useState } from 'react'
import heroImg from './assets/hero.png'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import './App.css'
import Navbar from './components/Navbar'

import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import TipoDocumentosCrud from './pages/TipoDocumentosCrud'
import UsuariosCrud from './pages/UsuariosCrud'
import CategoriaProductosCrud from './pages/CategoriaProductosCrud'
import TipoVehiculosCrud from './pages/TipoVehiculosCrud'
import MetodoPagosCrud from './pages/MetodoPagosCrud'

import Login from './pages/Login'
import Register from './pages/Register'

function App() {
  const [count, setCount] = useState(0)

  return (
    <BrowserRouter>
      <Navbar />

      <Routes>
        
        <Route path="/tipo-documentos" element={<TipoDocumentosCrud />} />
        <Route path="/usuarios" element={<UsuariosCrud />} />
        <Route path="/categoria-productos" element={<CategoriaProductosCrud />} />
        <Route path="/tipo-vehiculos" element={<TipoVehiculosCrud />} />
        <Route path="/metodo-pagos" element={<MetodoPagosCrud />} />
      
          <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        {/* fallback */}
        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>
    </BrowserRouter>
  )
}

export default App