import "dotenv/config";
import mongoose from "mongoose";
import faker, {userFaker} from "./faker.js";

const collection = "users";
const dataSchema = {
  username: String,
  email: String,
};

const schema = new mongoose.Schema({
  ...dataSchema,
}, { collection });

const model = mongoose.model(collection, schema);

console.log("Connecting to mongoose...");
await mongoose.connect(process.env.DATABASE_URL, {
  useNewUrlParser: true,
});
console.log("Connected to mongoose.");

console.log("Removing all data from collection...");
await model.deleteMany({}).exec();

console.log("Generating data...");

const users = faker(100, () => userFaker(dataSchema));

console.log("Inserting new data...");
await model.insertMany(users);
console.log("Done!");
process.exit(0);

