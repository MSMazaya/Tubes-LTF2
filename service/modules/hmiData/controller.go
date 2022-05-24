package hmiData

import (
	"github.com/gin-gonic/gin"
	"github.com/kamva/mgm/v3"
	"github.com/kamva/mgm/v3/operator"
	"go.mongodb.org/mongo-driver/bson"
)

func CreateData(c *gin.Context) {
    var body HmiData
    c.Bind(&body)

    mgm.Coll(&body).Create(&body)

    c.JSON(200, body)
}

func GetByUsername(c *gin.Context) {
    username := c.Param("username")

    result := []HmiData{}

    mgm.Coll(&HmiData{}).SimpleFind(&result, bson.M{"username": bson.M{operator.Eq: username}})

    c.JSON(200, result)
}
