const root = document.documentElement;
const toggle = document.getElementById("theme-toggle");

function currentTheme() {
  return root.getAttribute("data-theme") === "dark" ? "dark" : "light";
}

function buttonLabel(theme) {
  return theme === "dark" ? "Light" : "Dark";
}

toggle.textContent = buttonLabel(currentTheme());

toggle.addEventListener("click", () => {
  const next = currentTheme() === "dark" ? "light" : "dark";

  if (next === "dark") {
    root.setAttribute("data-theme", "dark");
  } else {
    root.removeAttribute("data-theme");
  }

  toggle.textContent = buttonLabel(next);

  try {
    localStorage.setItem("theme", next);
  } catch (error) {
    console.warn("Theme preference could not be saved.", error);
  }
});
