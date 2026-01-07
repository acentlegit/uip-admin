
import { useEffect, useState } from "react";
import { getEngines } from "../api/adminApi";

export function EngineList() {
  const [engines, setEngines] = useState<string[]>([]);

  useEffect(() => {
    getEngines().then(setEngines);
  }, []);

  return (
    <>
      <h2>Governed Engines</h2>
      <ul>
        {engines.map(e => (
          <li key={e}>{e}</li>
        ))}
      </ul>
    </>
  );
}
