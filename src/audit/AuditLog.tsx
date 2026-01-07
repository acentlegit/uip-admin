
import { useEffect, useState } from "react";
import { getAuditLog } from "../api/adminApi";

export function AuditLog() {
  const [log, setLog] = useState<any>(null);

  useEffect(() => {
    getAuditLog().then(setLog);
  }, []);

  return (
    <div>
      <h2>Admin Audit Log</h2>
      <pre>{JSON.stringify(log, null, 2)}</pre>
    </div>
  );
}
