# API Specification
This file is a reference guide for the expected inputs and outputs from the microservice

## GET Machines
Response
```
{
    id: "<UUID>",
    name: "<E.G. CNC Machine>",
    location: "<E.G. My House>",
    status: "<E.G. Online/Offline/Disabled>"
}
```

## POST New Machine
Request
```
{
    name: "<E.G. CNC Machine>",
    location: "<E.G. My House>"
}
```
Response (Status: 200)
```
{
    id: "<UUID>",
    name: "<E.G. CNC Machine>",
    location: "<E.G. My House>",
    status: "Offline"
}
```

## PUT Machine Status
Request
```
{
    id: "<UUID>",
    status: "<E.G. Online/Offline/Disabled>"
}
```
Response (Status: 200)
```
{
    id: "<UUID>",
    name: "<E.G. CNC Machine>",
    location: "<E.G. My House>",
    status: "Offline"
}
```
## GET Bookings
Response (Status: 200)
```
{
    machine_id: "<UUID>",
    job_id: "<E.G. J12345>"
    date: "2017-01-01",
    timeslot: "12"
}
```

## POST New Bookings
Request
```
{
    machineid: "<UUID>",
    jobid: "<E.G. J12345>",
    day: "2017-01-01",
    timeslot: "12"
}
```
Response (Status: 200)
```
{
    "Booking Confirmed"
}
```
