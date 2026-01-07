
export function BreakGlassPanel() {
  return (
    <div style={{ border: "2px solid red", padding: 12 }}>
      <h3>Emergency Break-Glass</h3>
      <textarea placeholder="Justification required" />
      <br />
      <button style={{ background: "red", color: "white" }}>
        Activate Emergency Override
      </button>
    </div>
  );
}
