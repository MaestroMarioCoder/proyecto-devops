// =============================================
// Store Online S.A. - API Base DevOps
// Servidor Express conectado a MySQL con reintento
// =============================================

import express from "express";
import mysql from "mysql2";
import dotenv from "dotenv";

dotenv.config();
const app = express();
app.use(express.json());

// ==============================
// FUNCIÓN DE CONEXIÓN A MYSQL
// ==============================
let db;

function conectarBD() {
  db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
  });

  db.connect(err => {
    if (err) {
      console.error("❌ Error al conectar a MySQL:", err.message);
      console.log("⏳ Reintentando conexión en 5 segundos...");
      setTimeout(conectarBD, 5000);
    } else {
      console.log("✅ Conectado a la base de datos MySQL correctamente.");
    }
  });
}

// Ejecutar la primera conexión
conectarBD();

// ==============================
// RUTAS DE PRUEBA
// ==============================
app.get("/", (req, res) => {
  res.send("🚀 API DevOps ejecutándose correctamente.");
});

app.get("/productos", (req, res) => {
  if (!db) return res.status(500).json({ error: "Base de datos no conectada" });

  db.query("SELECT * FROM productos", (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

// ==============================
// PUERTO DEL SERVIDOR
// ==============================
const PORT = process.env.PORT || 4000;
app.listen(PORT, () => console.log(`Servidor escuchando en puerto ${PORT}`));
