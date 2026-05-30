from flask import Flask, jsonify, request

app = Flask(__name__)

# In-memory incident store
incidents = [
    {
        "id": 1,
        "service_name": "payment-service",
        "severity": "high",
        "status": "open"
    },
    {
        "id": 2,
        "service_name": "auth-service",
        "severity": "medium",
        "status": "investigating"
    }
]


@app.route("/")
def home():
    return jsonify({
        "application": "SRE Incident Management API",
        "version": "1.0",
        "status": "running"
    })


@app.route("/health")
def health():
    return jsonify({
        "status": "healthy"
    })


@app.route("/incidents", methods=["GET"])
def get_incidents():
    return jsonify(incidents)


@app.route("/incidents", methods=["POST"])
def create_incident():

    data = request.get_json()

    if not data:
        return jsonify({
            "error": "Request body is required"
        }), 400

    if "service_name" not in data:
        return jsonify({
            "error": "service_name is required"
        }), 400

    if "severity" not in data:
        return jsonify({
            "error": "severity is required"
        }), 400

    new_incident = {
        "id": len(incidents) + 1,
        "service_name": data["service_name"],
        "severity": data["severity"],
        "status": "open"
    }

    incidents.append(new_incident)

    return jsonify({
        "message": "Incident created successfully",
        "incident": new_incident
    }), 201


@app.route("/incidents/<int:incident_id>", methods=["GET"])
def get_incident(incident_id):

    for incident in incidents:
        if incident["id"] == incident_id:
            return jsonify(incident)

    return jsonify({
        "error": "Incident not found"
    }), 404


@app.route("/stats", methods=["GET"])
def get_stats():

    total_incidents = len(incidents)

    open_incidents = len(
        [i for i in incidents if i["status"] == "open"]
    )

    investigating_incidents = len(
        [i for i in incidents if i["status"] == "investigating"]
    )

    resolved_incidents = len(
        [i for i in incidents if i["status"] == "resolved"]
    )

    return jsonify({
        "total_incidents": total_incidents,
        "open_incidents": open_incidents,
        "investigating_incidents": investigating_incidents,
        "resolved_incidents": resolved_incidents
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)