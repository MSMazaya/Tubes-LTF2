Needs:

1. Setor data robot berdasarkan username dan LatLng Location

2. Setor data tegangan masuk PV berdasarkan robot

Structures:

Struct Location {
    id:string,
    latitude: float,
    longitude: float,
    robot_id: string,
}

Struct Robot {
    id: string,
    username: String,
    location: Location,
}

Struct PVMeasure {
    id:string,
    robot_id: string,
    tegangan: float,
}
