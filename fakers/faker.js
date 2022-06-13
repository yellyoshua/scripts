import { faker } from "@faker-js/faker";

export function userFaker(userSchema = {}) {
  const user = {};

  if (!Object.keys(userSchema).length)
    userSchema = {
      name: true,
      email: true,
      username: true,
      age: true,
      grade: true,
    };

  userSchema.name && (user.name = faker.name.findName());
  userSchema.email && (user.email = faker.internet.email());
  userSchema.username && (user.username = faker.internet.userName().toLowerCase());
  userSchema.password && (user.password = faker.internet.password(20));
  userSchema.age && (user.age = faker.helpers.arrayElement([
    9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
  ]));
  userSchema.grade && (user.grade = faker.helpers.arrayElement([
    "1ro", "2do", "3ro", "4to", "5to", "6to", "7mo", "8vo", "9no", "10mo", "11vo", "12vo",
  ]));

  return user;
}

export default (count = 10, fake) => {
  const fakers = [];

  for (let i = 0; i < count; i++) {
    fake && fakers.push(fake());
  }

  return fakers;
}