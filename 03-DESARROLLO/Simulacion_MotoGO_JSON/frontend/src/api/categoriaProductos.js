import { axiosClient } from "./axiosClient";

export const categoriaProductos = {
  list: () => axiosClient.get("/categoria-productos"),
  getById: (id) => axiosClient.get(`/categoria-productos/${id}`),
  create: (data) => axiosClient.post("/categoria-productos", data),
  update: (id, data) => axiosClient.put(`/categoria-productos/${id}`, data),
  remove: (id) => axiosClient.delete(`/categoria-productos/${id}`),
};