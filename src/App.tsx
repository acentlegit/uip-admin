
import { EngineList } from "./engines/EngineList";
import { PendingApprovals } from "./approvals/PendingApprovals";
import { AuditLog } from "./audit/AuditLog";
import { BreakGlassPanel } from "./emergency/BreakGlassPanel";

export default function App() {
  return (
    <div style={{ padding: 24, fontFamily: "sans-serif" }}>
      <h1>UIP Admin Console</h1>
      <EngineList />
      <PendingApprovals />
      <AuditLog />
      <BreakGlassPanel />
    </div>
  );
}
