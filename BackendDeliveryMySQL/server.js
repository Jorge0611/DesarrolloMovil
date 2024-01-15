const express = require("express");
const app = express();
const http = require("http");
const server = http.createServer(app);
const logger = require("morgan");
const cors = require("cors");

/*
 * IMPORTAR RUTAS
 */
const usersRoutes = require("./routes/userRoutes");

const port = process.env.PORT || 3000;

app.use(logger("dev"));
app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

app.use(cors());

app.disable("x-powered-by");

app.set("port", port);

/*
 * LLAMADO DE LAS RUTAS
 */
usersRoutes(app);

server.listen(3000, "127.0.0.1", function () {
  console.log("Aplicación de NodeJS " + port + " Iniciada...");
});

// ERROR HANDLER
app.use((err, req, res, next) => {
  console.log(err);
  res.status(err.status || 500).send(err.stack);
});

// ADD USER ROUTES

// app.use("/api/users", usersRoutes);

app.get("/", (req, res) => {
  res.send("Ruta raíz del backend");
});

app.post("/test", (req, res) => {
  res.json({
    success: true,
    message: "La ruta test funciona correctamente",
  });
});

module.exports = {
  app: app,
  server: server,
};

// 200 - ES UN RESPUESTA EXITOSA
// 404 - SIGNIFICA QUE LA URL NO EXISTE
// 500 - ERROR INTERNO DEL SERVIDOR
