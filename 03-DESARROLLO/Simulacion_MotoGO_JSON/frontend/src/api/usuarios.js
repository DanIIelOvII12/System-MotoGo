import { axiosClient } from "./axiosClient";

export const usuarios = {
  list: () => axiosClient.get("/usuarios"),
  getById: (id) => axiosClient.get(`/usuarios/${id}`),
  create: (data) => axiosClient.post("/usuarios", data),
  update: (id, data) => axiosClient.put(`/usuarios/${id}`, data),
  remove: (id) => axiosClient.delete(`/usuarios/${id}`),
};