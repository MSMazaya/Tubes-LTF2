package main

import (
	"os"
	"service/modules/hmiData"
	"service/modules/robot"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"github.com/kamva/mgm/v3"
	"go.mongodb.org/mongo-driver/mongo/options"
)

func main() {
    err_env := godotenv.Load() 

    if err_env != nil {
        panic(err_env)
    }

    db_string := os.Getenv("DB_STRING")

	r := gin.Default()
    err := mgm.SetDefaultConfig(nil, "mazaya", options.Client().ApplyURI(db_string))

    if err != nil {
        panic(err)
    }

	r.POST("/robot", robot.CreateRobot);
	r.GET("/robot", robot.GetAllRobots);
    r.POST("/hmi-data", hmiData.CreateData);
    r.GET("/hmi-data/:username", hmiData.GetByUsername);
    r.Run(":8888") // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
