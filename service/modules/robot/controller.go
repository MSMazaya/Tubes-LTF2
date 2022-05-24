package robot

import (
	"github.com/gin-gonic/gin"
	"github.com/kamva/mgm/v3"
	"go.mongodb.org/mongo-driver/bson"
)

func CreateRobot(c *gin.Context) {
    var body Robot
    c.Bind(&body)

    mgm.Coll(&body).Create(&body)

    c.JSON(200, body)
}

func GetAllRobots(c *gin.Context) {

    results := []Robot{}

    mgm.Coll(&Robot{}).SimpleFind(&results, bson.D{});

    c.JSON(200, results)
}
