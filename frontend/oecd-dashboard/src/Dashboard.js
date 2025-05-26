import React, { useState, useEffect } from "react";
import axios from "axios";
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from "recharts";
import "./Dashboard.css";

const API_BASE_URL = "http://localhost:8000";

const Dashboard = () => {
  const [countries, setCountries] = useState([]);
  const [selectedCountries, setSelectedCountries] = useState([
    "DEU",
    "FRA",
    "GBR",
    "ITA",
    "ESP",
  ]);
  const [selectedIndustry, setSelectedIndustry] = useState("ATU");
  const [industries, setIndustries] = useState([]);
  const [comparisonData, setComparisonData] = useState({});
  const [allCountriesData, setAllCountriesData] = useState([]);
  const [loading, setLoading] = useState(false);
  const [token, setToken] = useState(localStorage.getItem("token"));
  const [loginForm, setLoginForm] = useState({ username: "", password: "" });

  // Colors for charts
  const COLORS = [
    "#FF6B6B",
    "#4ECDC4",
    "#45B7D1",
    "#96CEB4",
    "#FECA57",
    "#DDA0DD",
    "#98D8C8",
    "#F7DC6F",
  ];

  // Login function
  const handleLogin = async () => {
    try {
      const response = await axios.post(`${API_BASE_URL}/auth/login`, null, {
        params: loginForm,
      });
      setToken(response.data.access_token);
      localStorage.setItem("token", response.data.access_token);
    } catch (error) {
      alert("Login failed!");
    }
  };

  // Logout function
  const handleLogout = () => {
    setToken(null);
    localStorage.removeItem("token");
  };

  // Fetch countries
  useEffect(() => {
    const fetchCountries = async () => {
      try {
        const response = await axios.get(`${API_BASE_URL}/countries`);
        setCountries(response.data);
      } catch (error) {
        console.error("Error fetching countries:", error);
      }
    };
    if (token) {
      fetchCountries();
    }
  }, [token]);

  // Fetch industries
  useEffect(() => {
    const fetchIndustries = async () => {
      try {
        const response = await axios.get(`${API_BASE_URL}/industries`);
        setIndustries([
          { industry_code: "ATU", industry_name: "All Industries" },
          ...response.data,
        ]);
      } catch (error) {
        console.error("Error fetching industries:", error);
      }
    };
    if (token) {
      fetchIndustries();
    }
  }, [token]);

  // Fetch all countries overview
  useEffect(() => {
    const fetchAllCountriesData = async () => {
      if (countries.length === 0) return;

      setLoading(true);
      try {
        // Get all countries productivity for overview
        const countryPromises = countries.slice(0, 20).map((country) =>
          axios
            .get(
              `${API_BASE_URL}/productivity/${country.country_code}?industry=ATU`
            )
            .then((res) => ({
              country_code: country.country_code,
              country_name: country.country_name,
              data: res.data,
            }))
            .catch(() => null)
        );

        const results = await Promise.all(countryPromises);
        const validResults = results.filter((r) => r && r.data.length > 0);

        const overviewData = validResults
          .map((r) => {
            const latestData = r.data.find((d) => d.transformation === "_Z");
            return {
              country: r.country_name,
              value: latestData ? latestData.value : 0,
            };
          })
          .sort((a, b) => b.value - a.value);

        setAllCountriesData(overviewData);
      } catch (error) {
        console.error("Error fetching all countries data:", error);
      }
      setLoading(false);
    };

    if (token && countries.length > 0) {
      fetchAllCountriesData();
    }
  }, [countries, token]);

  // Fetch comparison data
  useEffect(() => {
    const fetchComparison = async () => {
      if (selectedCountries.length === 0) return;

      setLoading(true);
      try {
        const response = await axios.get(
          `${API_BASE_URL}/productivity/compare?countries=${selectedCountries.join(
            ","
          )}&industry=${selectedIndustry}`,
          {
            headers: token ? { Authorization: `Bearer ${token}` } : {},
          }
        );
        setComparisonData(response.data);
      } catch (error) {
        console.error("Error fetching comparison:", error);
      }
      setLoading(false);
    };

    if (token) {
      fetchComparison();
    }
  }, [selectedCountries, selectedIndustry, token]);

  // Handle country selection
  const toggleCountry = (countryCode) => {
    setSelectedCountries((prev) => {
      if (prev.includes(countryCode)) {
        return prev.filter((c) => c !== countryCode);
      } else if (prev.length < 8) {
        // Limit to 8 countries
        return [...prev, countryCode];
      }
      return prev;
    });
  };

  // Login form
  if (!token) {
    return (
      <div className="login-container">
        <div className="login-box">
          <h2>OECD Analytics Login</h2>
          <input
            type="text"
            placeholder="Username"
            value={loginForm.username}
            onChange={(e) =>
              setLoginForm({ ...loginForm, username: e.target.value })
            }
          />
          <input
            type="password"
            placeholder="Password"
            value={loginForm.password}
            onChange={(e) =>
              setLoginForm({ ...loginForm, password: e.target.value })
            }
            onKeyPress={(e) => e.key === "Enter" && handleLogin()}
          />
          <button onClick={handleLogin}>Login</button>
          <p className="hint">Demo: bundesdruckerei / demo123</p>
        </div>
      </div>
    );
  }

  // Prepare data for comparison chart
  const prepareComparisonData = () => {
    return Object.entries(comparisonData).map(([country, data]) => ({
      country: country,
      value: data.length > 0 ? data[0].value : 0,
    }));
  };

  return (
    <div className="dashboard">
      {/* Header */}
      <header>
        <div className="header-content">
          <h1>OECD Productivity Analytics Dashboard</h1>
          <button onClick={handleLogout} className="logout-btn">
            Logout
          </button>
        </div>
      </header>

      {/* Main Content */}
      <main>
        {/* Global Overview */}
        <div className="overview-card">
          <h2>Global Productivity Overview (2023)</h2>
          <p className="subtitle">
            Top 20 Countries by Overall Productivity Index (2015=100)
          </p>

          {loading && allCountriesData.length === 0 ? (
            <div className="loading">Loading...</div>
          ) : (
            <div className="chart-container">
              <ResponsiveContainer width="100%" height={400}>
                <BarChart
                  data={allCountriesData}
                  margin={{ top: 20, right: 30, left: 20, bottom: 100 }}
                >
                  <CartesianGrid strokeDasharray="3 3" />
                  <XAxis
                    dataKey="country"
                    angle={-45}
                    textAnchor="end"
                    height={100}
                  />
                  <YAxis />
                  <Tooltip formatter={(value) => value.toFixed(2)} />
                  <Bar dataKey="value" fill="#3498db" />
                </BarChart>
              </ResponsiveContainer>
            </div>
          )}
        </div>

        {/* Country and Industry Selection */}
        <div className="selection-card">
          <h2>Custom Comparison</h2>

          {/* Industry Selector */}
          <div className="controls-row">
            <div className="industry-selector">
              <label>Select Industry:</label>
              <select
                value={selectedIndustry}
                onChange={(e) => setSelectedIndustry(e.target.value)}
                className="industry-select"
              >
                {industries.map((ind) => (
                  <option key={ind.industry_code} value={ind.industry_code}>
                    {ind.industry_name}
                  </option>
                ))}
              </select>
            </div>
          </div>

          {/* Country Selector */}
          <div className="country-selector">
            <p>Select countries to compare (max 8):</p>
            <div className="country-chips">
              {countries.map((country) => (
                <div
                  key={country.country_code}
                  className={`country-chip ${
                    selectedCountries.includes(country.country_code)
                      ? "selected"
                      : ""
                  }`}
                  onClick={() => toggleCountry(country.country_code)}
                >
                  {country.country_name}
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* Custom Comparison Chart */}
        <div className="comparison-card">
          <h2>
            Productivity Comparison -{" "}
            {industries.find((i) => i.industry_code === selectedIndustry)
              ?.industry_name || "All Industries"}
          </h2>
          <p className="subtitle">Selected Countries Comparison (2023)</p>

          {loading ? (
            <div className="loading">Loading...</div>
          ) : (
            Object.keys(comparisonData).length > 0 && (
              <div className="chart-container">
                <ResponsiveContainer width="100%" height={400}>
                  <BarChart
                    data={prepareComparisonData()}
                    margin={{ top: 20, right: 30, left: 20, bottom: 100 }}
                  >
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis
                      dataKey="country"
                      angle={-45}
                      textAnchor="end"
                      height={100}
                    />
                    <YAxis />
                    <Tooltip formatter={(value) => value.toFixed(2)} />
                    <Legend />
                    <Bar dataKey="value" name="Productivity Index">
                      {prepareComparisonData().map((entry, index) => (
                        <Bar
                          key={`cell-${index}`}
                          fill={COLORS[index % COLORS.length]}
                        />
                      ))}
                    </Bar>
                  </BarChart>
                </ResponsiveContainer>
              </div>
            )
          )}
        </div>

        {/* Data Summary */}
        <div className="summary-card">
          <h2>Data Summary</h2>
          <div className="summary-grid">
            <div className="summary-item">
              <p className="label">Total Countries</p>
              <p className="value">{countries.length}</p>
            </div>
            <div className="summary-item">
              <p className="label">Industries Tracked</p>
              <p className="value">{industries.length - 1}</p>
            </div>
            <div className="summary-item">
              <p className="label">Latest Data Year</p>
              <p className="value">2023</p>
            </div>
            <div className="summary-item">
              <p className="label">Selected Countries</p>
              <p className="value">{selectedCountries.length}</p>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
};

export default Dashboard;
