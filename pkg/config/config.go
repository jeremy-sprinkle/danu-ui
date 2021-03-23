package config

import (
	"encoding/json"
	"io/ioutil"
)

type APIConfig struct {
	Port int `json:"port"`
}

type Config struct {
	APIConfig     *APIConfig          `json:"api"`
}

func LoadConfig(path string) (*Config, error) {
	b, err := ioutil.ReadFile(path)
	if err != nil {
		return nil, err
	}

	var config Config

	err = json.Unmarshal(b, &config)
	if err != nil {
		return nil, err
	}

	return &config, nil
}
