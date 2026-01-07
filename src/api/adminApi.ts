
export async function getEngines(): Promise<string[]> {
  return fetch("/admin/engines").then(r => r.json());
}

export async function getAuditLog() {
  return fetch("/admin/reports/changes").then(r => r.json());
}
