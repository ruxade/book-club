async function searchGoogleBooks(query) {
  let response = await fetch(`/google_books/search?query=${encodeURIComponent(query)}`);
  let books = await response.json();

  let resultsContainer = document.getElementById("search-results");
  resultsContainer.innerHTML = ""; // Clear previous results

  books.forEach(book => {
    let bookElement = document.createElement("div");
    bookElement.innerHTML = `
      <img src="${book.cover_url || 'placeholder.jpg'}" alt="${book.title}" width="100">
      <h3>${book.title}</h3>
      <p><strong>Author:</strong> ${book.authors}</p>
      <p><strong>Published:</strong> ${book.publication_year}</p>
      <p><strong>Pages:</strong> ${book.page_count}</p>
      <p><strong>Categories:</strong> ${book.categories}</p>
      <p><strong>Rating:</strong> ${book.average_rating} / 5</p>
      <p>${book.overview}</p>
      <button onclick="addBookToList('${book.google_id}', '${book.title}', '${book.authors}', '${book.publication_year}', '${book.page_count}', '${book.categories}', '${book.average_rating}', '${book.cover_url}', '${book.overview}')">Add to List</button>
    `;
    resultsContainer.appendChild(bookElement);
  });
}
