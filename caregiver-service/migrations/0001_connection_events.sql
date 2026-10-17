-- Apply once to the existing remote caregiver D1 database. This preserves all
-- current plans and only adds a privacy-safe, plan-scoped connection history.
CREATE TABLE IF NOT EXISTS connection_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  plan_id TEXT NOT NULL REFERENCES plans(id) ON DELETE CASCADE,
  event_type TEXT NOT NULL CHECK (event_type IN ('paired', 'caregiver-left')),
  occurred_at INTEGER NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_connection_events_plan_time
  ON connection_events(plan_id, occurred_at DESC);
