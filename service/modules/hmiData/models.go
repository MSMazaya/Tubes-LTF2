package hmiData

import "github.com/kamva/mgm/v3"

type HmiData struct {
	mgm.DefaultModel `bson:",inline"`
	Username         string   `json:"username" bson:"username" binding:"required"`
	Voltage          *float32 `json:"voltage" bson:"voltage" binding:"required"`
}
