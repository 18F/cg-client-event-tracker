# 18F Client Event Tracker


Event Tracking Environment: [Production](https://client-events.app.cloud.gov)


## Introduction

This is a web application to manage track events for cloud.gov dashboard users.

## Tech Stack

### Server
- `Ruby` (version 2.4.1)
- `Rails` (version 5.1.0)

## How to track events

### Visits

When a user launches the app, create a visit.

Generate a `visit_token` and `visitor_token` as [UUIDs](http://en.wikipedia.org/wiki/Universally_unique_identifier).

Send these values in the `Ahoy-Visit` and `Ahoy-Visitor` headers with all requests.

Send a `POST` request to `https://client-events.app.cloud.gov/ahoy/visits` with:

- platform - `web`, `iOS`, etc.
- app_version - `1.0.0`
- os_version - `7.0.6`

After 4 hours of inactivity, create another visit and use the updated visit id.

### Events

Send a `POST` request as `Content-Type: application/json` to `https://client-events.app.cloud.gov/ahoy/events` with:

- id - `5aea7b70-182d-4070-b062-b0a09699ad5e` - UUID
- name - `Viewed item`
- properties - `{"item_id": 123}`
- time - `2014-06-17T00:00:00-07:00` - [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
- `Ahoy-Visit` and `Ahoy-Visitor` headers
- user token (depends on your authentication framework)

Use an array to pass multiple events at once.

### Monitor

The event review dashboard is based on [Blazer](https://github.com/ankane/blazer). Blazer allows you to explore the stored events with SQL, easily create charts and dashboards, and share them with your team.

[See more about Blazer](https://github.com/ankane/blazer)

[Production](https://client-events.app.cloud.gov/blazer)

[![Screenshot](https://blazerme.herokuapp.com/assets/screenshot-6ca3115a518b488026e48be83ba0d4c9.png)](https://client-events.app.cloud.gov/blazer)