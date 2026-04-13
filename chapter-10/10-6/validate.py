import json
import subprocess
import csv
from datetime import datetime

OUTPUT_FILE = "security_groups_dashboard.csv"

def get_terraform_state():
    result = subprocess.run( [ "terraform", "show", "-json" ], capture_output=True, text=True, check=True )
    return json.loads(result.stdout)

def extract_security_groups(state_json):
    resources = state_json.get("values", {}).get("root_module", {}).get("resources", [])
    security_groups = []

    for resource in resources:
        if resource["type"] == "aws_security_group":
            values = resource["values"]

            security_groups.append({
                "id": values.get("id"),
                "name": values.get("name"),
                "description": values.get("description"),
                "vpc_id": values.get("vpc_id"),
                "ingress_rules": len(values.get("ingress", [])),
                "egress_rules": len(values.get("egress", [])),
                "last_updated": datetime.utcnow().isoformat()
            })

    return security_groups

def write_dashboard(security_groups):
    with open(OUTPUT_FILE, "w", newline="") as csvfile:
        fieldnames = [ "id", "name", "description", "vpc_id", "ingress_rules", "egress_rules", "last_updated" ]

        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()

        for sg in security_groups:
            writer.writerow(sg)

def main():
    state = get_terraform_state()
    security_groups = extract_security_groups(state)
    write_dashboard(security_groups)

if __name__ == "__main__":
    main()
