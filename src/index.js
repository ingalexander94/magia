import app from "./app.js";
import * as dotenv from "dotenv";
dotenv.config();

const { PORT } = process.env;

app.listen(PORT, () => {
  console.log(`Servidor corriendo en el puerto ${PORT}`);
});
