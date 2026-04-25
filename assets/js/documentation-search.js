const root = document.querySelector("[data-doc-search]");

if (root) {
  const input = root.querySelector("[data-doc-search-input]");
  const results = root.querySelector("[data-doc-search-results]");
  const status = root.querySelector("[data-doc-search-status]");

  let pagefindInstance = null;
  let searchToken = 0;
  let debounceId = null;

  const escapeHtml = (value = "") =>
    value
      .replaceAll("&", "&amp;")
      .replaceAll("<", "&lt;")
      .replaceAll(">", "&gt;")
      .replaceAll('"', "&quot;")
      .replaceAll("'", "&#39;");

  const setStatus = (message) => {
    status.textContent = message;
  };

  const hideResults = () => {
    results.classList.remove("is-visible");
    results.innerHTML = "";
    setStatus("");
  };

  const showMessage = (message, extraClass = "text-muted") => {
    results.innerHTML = `<div class="p-3 small ${extraClass}">${escapeHtml(message)}</div>`;
    results.classList.add("is-visible");
    setStatus(message);
  };

  const loadPagefind = async () => {
    if (pagefindInstance !== null) {
      return pagefindInstance;
    }

    const pagefind = await import("/pagefind/pagefind.js");
/*
    await pagefind.options({
      ranking: {
          pageLength: 0.6,
          termSaturation: 1.8,
      },
    });
*/
    await pagefind.init();
    pagefindInstance = pagefind;

    return pagefindInstance;
  };

  const renderSubResults = (subResults) => {
    const items = subResults
      .filter((item) => item.url && item.anchor && item.title)
      .slice(0, 2)
      .map((item) => {
        const title = escapeHtml(item.title);
        return `<a class="docs-search-subresult text-decoration-none" href="${item.url}">↳ ${title}</a>`;
      });

    if (items.length === 0) {
      return "";
    }

    return `<div class="docs-search-subresults mt-2">${items.join("")}</div>`;
  };

  const renderResults = (items) => {
    const markup = items
      .map((item) => {
        const title = escapeHtml(item.meta?.title || item.url || "Documentation");
        const excerpt = item.excerpt || "";
        const subResults = renderSubResults(item.sub_results || []);

        return `
          <div class="list-group-item">
            <a class="fw-semibold text-decoration-none" href="${item.url}">${title}</a>
            <div class="small text-muted mt-2">${excerpt}</div>
            ${subResults}
          </div>
        `;
      })
      .join("");

    results.innerHTML = `<div class="list-group list-group-flush">${markup}</div>`;
    results.classList.add("is-visible");
    setStatus(`${items.length} search results loaded.`);
  };

  const performSearch = async (term) => {
    const query = term.trim();

    if (query.length < 2) {
      hideResults();
      return;
    }

    const currentSearch = ++searchToken;
    showMessage("Searching ...");

    try {
      const pagefind = await loadPagefind();
      await pagefind.preload(query);

      const search = await pagefind.search(query);
      const matches = search.results.slice(0, 6);

      if (currentSearch !== searchToken) {
        return;
      }

      if (matches.length === 0) {
        showMessage("No matches found.");
        return;
      }

      const items = await Promise.all(matches.map((match) => match.data()));

      if (currentSearch !== searchToken) {
        return;
      }

      renderResults(items);
    } catch (error) {
      console.error(error);
      showMessage("Search is currently unavailable.", "text-danger");
    }
  };

  input.addEventListener("focus", () => {
    loadPagefind().catch(() => {
      setStatus("Search is currently unavailable.");
    });
  });

  input.addEventListener("input", () => {
    window.clearTimeout(debounceId);

    if (input.value.trim() === "") {
      hideResults();
      return;
    }

    debounceId = window.setTimeout(() => {
      performSearch(input.value);
    }, 120);
  });

  document.addEventListener("click", (event) => {
    if (!root.contains(event.target)) {
      hideResults();
    }
  });

  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape") {
      hideResults();
      input.blur();
    }
  });
}
