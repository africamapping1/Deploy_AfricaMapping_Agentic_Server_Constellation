export default function RealEstatePortfolioUI() {
  const data = {
    tenant: "realestate-ai",
    platform: {
      heartbeat_state: "steady",
      governance_health: "healthy",
    },
    portfolio: {
      property_count: 2,
      portfolio_value: 770000,
      monthly_income: 4600,
      annual_income: 55200,
      average_roi: 7.2,
      estimated_yield_percent: 7.17,
      risk: "medium",
      trend: "up",
      occupancy_status: "occupied-assumed",
      recommendation: "SELECTIVE POTENTIAL",
      best_opportunity: "project-001 (Evaluate 123 Example Street) → 7.54%",
      lowest_yield: "project-002 (Evaluate 456 Oak Avenue) → 6.86%",
    },
    properties: [
      {
        id: "project-001",
        name: "Evaluate 123 Example Street",
        address: "123 Example Street",
        city: "Austin",
        state: "TX",
        status: "active",
        value: 350000,
        monthly_income: 2200,
        annual_income: 26400,
        estimated_roi: 7.54,
      },
      {
        id: "project-002",
        name: "Evaluate 456 Oak Avenue",
        address: "456 Oak Avenue",
        city: "Dallas",
        state: "TX",
        status: "active",
        value: 420000,
        monthly_income: 2400,
        annual_income: 28800,
        estimated_roi: 6.86,
      },
    ],
    portfolio_groups: [
      {
        id: "program-001",
        name: "Starter Property Portfolio",
        status: "active",
        projects: ["project-001", "project-002"],
      },
    ],
    governor: {
      decision: "APPROVED: Active work detected. System operating normally.",
    },
    infrastructure: {
      restart_required: true,
      gpu: "none",
    },
  };

  const fmtMoney = (value: number) =>
    new Intl.NumberFormat("en-US", {
      style: "currency",
      currency: "USD",
      maximumFractionDigits: 0,
    }).format(value);

  const fmtPct = (value: number) => `${value.toFixed(2)}%`;

  const summaryCards = [
    { label: "Portfolio Value", value: fmtMoney(data.portfolio.portfolio_value) },
    { label: "Monthly Income", value: fmtMoney(data.portfolio.monthly_income) },
    { label: "Annual Income", value: fmtMoney(data.portfolio.annual_income) },
    { label: "Average ROI", value: fmtPct(data.portfolio.average_roi) },
    { label: "Estimated Yield", value: fmtPct(data.portfolio.estimated_yield_percent) },
    { label: "Risk", value: data.portfolio.risk },
  ];

  const bestRoi = Math.max(...data.properties.map((p) => p.estimated_roi));

  return (
    <div className="min-h-screen bg-slate-50 p-6 md:p-10">
      <div className="mx-auto max-w-7xl space-y-8">
        <div className="flex flex-col gap-4 rounded-3xl bg-white p-6 shadow-sm md:flex-row md:items-center md:justify-between">
          <div>
            <p className="text-sm uppercase tracking-[0.2em] text-slate-500">Tenant dashboard</p>
            <h1 className="mt-2 text-3xl font-semibold text-slate-900">RealEstate AI Portfolio</h1>
            <p className="mt-2 text-sm text-slate-600">
              A user-facing portfolio view powered by your tenant-specific ASC intelligence layer.
            </p>
          </div>

          <div className="grid grid-cols-2 gap-3 text-sm md:grid-cols-3">
            <div className="rounded-2xl bg-slate-100 px-4 py-3">
              <div className="text-slate-500">Heartbeat</div>
              <div className="font-medium text-slate-900">{data.platform.heartbeat_state}</div>
            </div>
            <div className="rounded-2xl bg-slate-100 px-4 py-3">
              <div className="text-slate-500">Governance</div>
              <div className="font-medium text-slate-900">{data.platform.governance_health}</div>
            </div>
            <div className="rounded-2xl bg-slate-100 px-4 py-3 col-span-2 md:col-span-1">
              <div className="text-slate-500">Recommendation</div>
              <div className="font-medium text-slate-900">{data.portfolio.recommendation}</div>
            </div>
          </div>
        </div>

        <div className="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-6">
          {summaryCards.map((card) => (
            <div key={card.label} className="rounded-3xl bg-white p-5 shadow-sm">
              <p className="text-sm text-slate-500">{card.label}</p>
              <p className="mt-2 text-2xl font-semibold text-slate-900">{card.value}</p>
            </div>
          ))}
        </div>

        <div className="grid grid-cols-1 gap-6 xl:grid-cols-[1.5fr,1fr]">
          <div className="rounded-3xl bg-white p-6 shadow-sm">
            <div className="flex items-center justify-between">
              <div>
                <h2 className="text-xl font-semibold text-slate-900">Properties</h2>
                <p className="mt-1 text-sm text-slate-500">Robinhood-style asset cards for your real estate holdings.</p>
              </div>
              <div className="rounded-full bg-slate-100 px-4 py-2 text-sm font-medium text-slate-700">
                {data.portfolio.property_count} assets
              </div>
            </div>

            <div className="mt-6 grid gap-4 lg:grid-cols-2">
              {data.properties.map((property) => {
                const isTop = property.estimated_roi === bestRoi;
                return (
                  <div key={property.id} className="rounded-3xl border border-slate-200 p-5 transition hover:shadow-md">
                    <div className="flex items-start justify-between gap-3">
                      <div>
                        <h3 className="text-lg font-semibold text-slate-900">{property.address}</h3>
                        <p className="text-sm text-slate-500">{property.city}, {property.state}</p>
                      </div>
                      <span className={`rounded-full px-3 py-1 text-xs font-medium ${isTop ? "bg-emerald-100 text-emerald-700" : "bg-slate-100 text-slate-700"}`}>
                        {isTop ? "Best ROI" : property.status}
                      </span>
                    </div>

                    <div className="mt-5 grid grid-cols-2 gap-4 text-sm">
                      <div>
                        <p className="text-slate-500">Value</p>
                        <p className="font-semibold text-slate-900">{fmtMoney(property.value)}</p>
                      </div>
                      <div>
                        <p className="text-slate-500">Monthly Income</p>
                        <p className="font-semibold text-slate-900">{fmtMoney(property.monthly_income)}</p>
                      </div>
                      <div>
                        <p className="text-slate-500">Annual Income</p>
                        <p className="font-semibold text-slate-900">{fmtMoney(property.annual_income)}</p>
                      </div>
                      <div>
                        <p className="text-slate-500">Estimated ROI</p>
                        <p className="font-semibold text-slate-900">{fmtPct(property.estimated_roi)}</p>
                      </div>
                    </div>

                    <div className="mt-5 flex gap-3">
                      <button className="rounded-2xl bg-slate-900 px-4 py-2 text-sm font-medium text-white">View details</button>
                      <button className="rounded-2xl border border-slate-300 px-4 py-2 text-sm font-medium text-slate-700">Simulate</button>
                    </div>
                  </div>
                );
              })}
            </div>
          </div>

          <div className="space-y-6">
            <div className="rounded-3xl bg-white p-6 shadow-sm">
              <h2 className="text-xl font-semibold text-slate-900">Strategist insight</h2>
              <div className="mt-4 space-y-4 text-sm text-slate-700">
                <div className="rounded-2xl bg-slate-50 p-4">
                  <p className="font-medium text-slate-900">Best opportunity</p>
                  <p className="mt-1">{data.portfolio.best_opportunity}</p>
                </div>
                <div className="rounded-2xl bg-slate-50 p-4">
                  <p className="font-medium text-slate-900">Lowest yield</p>
                  <p className="mt-1">{data.portfolio.lowest_yield}</p>
                </div>
                <div className="rounded-2xl bg-slate-50 p-4">
                  <p className="font-medium text-slate-900">Portfolio group</p>
                  <p className="mt-1">{data.portfolio_groups[0].name}</p>
                </div>
              </div>
            </div>

            <div className="rounded-3xl bg-white p-6 shadow-sm">
              <h2 className="text-xl font-semibold text-slate-900">Operations status</h2>
              <div className="mt-4 space-y-3 text-sm text-slate-700">
                <div className="flex items-center justify-between rounded-2xl bg-slate-50 px-4 py-3">
                  <span>Governor</span>
                  <span className="max-w-[55%] text-right font-medium text-slate-900">Approved</span>
                </div>
                <div className="flex items-center justify-between rounded-2xl bg-slate-50 px-4 py-3">
                  <span>Occupancy</span>
                  <span className="font-medium text-slate-900">{data.portfolio.occupancy_status}</span>
                </div>
                <div className="flex items-center justify-between rounded-2xl bg-slate-50 px-4 py-3">
                  <span>Trend</span>
                  <span className="font-medium text-slate-900">{data.portfolio.trend}</span>
                </div>
                <div className="flex items-center justify-between rounded-2xl bg-slate-50 px-4 py-3">
                  <span>Infrastructure</span>
                  <span className={`font-medium ${data.infrastructure.restart_required ? "text-amber-700" : "text-emerald-700"}`}>
                    {data.infrastructure.restart_required ? "Restart required" : "Stable"}
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

