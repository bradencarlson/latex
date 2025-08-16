
console.log("hello from JS!")

/**************************************************
 * Load Pages
 **************************************************/

async function loadSplash() {
  try {
    const response = await fetch("./splash.html")

    if (!response.ok) {
      throw new Error("Something went wrong loading the splash page.")
    }

    const content = await response.text()

    const div = document.querySelector("div[id=content]")
    div.innerHTML = content;
  } catch (error) {
    throw new Error(error.error)
  }
}

