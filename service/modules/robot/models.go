package robot

import "github.com/kamva/mgm/v3"

type Robot struct {
	mgm.DefaultModel `bson:",inline"`
	Username         string   `json:"username" bson:"username" binding:"required"`
	Latitude         *float32 `json:"latitude" bson:"latitude" binding:"required"`
	Longitude        *float32 `json:"longitude" bson:"longitude" binding:"required"`
}
