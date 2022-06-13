import "dotenv/config";
import fs from "fs";
import faker, {userFaker} from "./faker.js";

const outputFile = "users.json";

console.log("Generating data...");

const users = faker(100, () => userFaker({
  name: true,
  username: true,
  email: true,
}));

console.log("Setting up data...");

try {
  fs.readdirSync("out");
} catch (error) {}

try {
  fs.mkdirSync("out");
} catch (error) {}

console.log("Inserting new data...");

fs.writeFileSync("out/" + outputFile, JSON.stringify({
  data: users,
}));

console.log("Done!");
process.exit(0);
