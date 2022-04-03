package main

import (
	"fmt"

	"github.com/brianvoe/gofakeit/v6"
)

type User struct {
	name     string
	password string
}

func FakeUsers(cnt int) []User {
	var users []User
	for cnt != 0 {
		u := User{name: gofakeit.Email(), password: gofakeit.Password(true, true, true, false, false, 12)}
		fmt.Println(u)
		users = append(users, u)
		cnt -= 1
	}
	return users
}
