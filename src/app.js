import express from "express";
import cors from "cors";

const app = express();

app.use(cors());
app.use(express.json());

app.get("/ping", async (_, res) => {
  let pedo = "";
  for (let i = 1; i <= 15011; i++) {
    pedo += `('Usuario${i}'), `;
  }
  return res.json(pedo);
});

export default app;
