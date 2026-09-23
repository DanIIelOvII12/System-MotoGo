import { axiosClient } from "./axiosClient";

export const metodoPagos = {
  list: () => axiosClient.get("/metodo-pagos"),
  getById: (id) => axiosClient.get(`/metodo-pagos/${id}`),
  create: (data) => axiosClient.post("/metodo-pagos", data),
  update: (id, data) => axiosClient.put(`/metodo-pagos/${id}`, data),
  remove: (id) => axiosClient.delete(`/metodo-pagos/${id}`),
};