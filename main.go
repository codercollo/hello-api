package main

import (
	"encoding/json"
	"log"
	"net/http"
)

type Resp struct {
	Language    string `json:"language"`
	Translation string `json:"translation"`
}

func main() {
	addr := ":8080"
	mux := http.NewServeMux()

	mux.HandleFunc("/hello", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json; charset=utf-8")
		resp := Resp{
			Language:    "English",
			Translation: "Hello",
		}

		if err := json.NewEncoder(w).Encode(resp); err != nil {
			log.Fatalf("unable to encode response: %v", err)
		}
	})

	log.Printf("listening on %s\n", addr)
	log.Fatal(http.ListenAndServe(addr, mux))
}

