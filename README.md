
# 🎬 Movie Recommendation System

This project is a **content-based movie recommender system** built with **Streamlit**. It recommends similar movies based on a selected title and displays their poster images by integrating with **The Movie Database (TMDb) API**.

---

## 🔍 How It Works

The system uses precomputed **cosine similarity** between movie metadata (tags) to recommend 5 similar movies to the user-selected title.

### 💡 Core Logic:
- Movie metadata is combined into tags (overview, cast, crew, genres).
- Tags are stemmed and vectorized using `CountVectorizer`.
- Cosine similarity is computed and stored.
- Poster images are fetched from TMDb using movie IDs.

---

## 📦 File Structure

```
Movie-Recommender-System/
├── app/
│   └── app.py                 # Streamlit frontend
├── data/
│   ├── movies_dict.pkl        # Metadata dictionary
│   ├── similarity.pkl         # Cosine similarity matrix
│   └── tmdb_5000_movies.csv   # Raw dataset
├── notebooks/
│   └── Movie_Recommender_System.ipynb
├── scripts/
│   └── setup.sh
├── .gitignore
├── Procfile
├── LICENSE
├── README.md
├── requirements.txt
```

---

## 🚀 Usage Guide

### 🔧 Setup

1. **Install dependencies**  
   Make sure Python ≥ 3.8 is installed.

   ```bash
   pip install -r requirements.txt
   ```

2. **Run the app**

   ```bash
   streamlit run app/app.py
   ```

3. **Select a movie** from the dropdown.
4. Click **"Recommend"** to get 5 similar movie suggestions with posters.

---

## 🔑 API Configuration

This project uses the **TMDb API** to fetch movie posters.

- Sign up at [TMDb](https://www.themoviedb.org/)
- Replace `api_key=...` in `fetch_poster()` with your key.

```python
url = f"https://api.themoviedb.org/3/movie/{movie_id}?api_key=YOUR_API_KEY"
```

---

## 🧠 Core Components

### 🛠️ Dependencies

| Library      | Purpose                          |
|--------------|----------------------------------|
| `streamlit`  | Web interface                    |
| `pandas`     | Data handling                    |
| `numpy`      | Array operations                 |
| `requests`   | TMDb API calls                   |
| `scikit-learn` | Cosine similarity + vectorizer |
| `nltk`       | Text stemming                    |
| `pickle`     | Save/load processed data         |

### 📊 Preprocessing Steps

- Top 3 cast names extracted
- Only director extracted from crew
- Tags created by combining metadata
- Tags stemmed using `PorterStemmer`
- Vectorized via `CountVectorizer`
- Cosine similarity matrix generated

---

## ⚙️ Caching & Performance

```python
@st.cache_data
def load_data():
    return pickle.load(open('movies_dict.pkl', 'rb'))
```

---

## 📈 Visualization Layout

```python
col1, col2, col3, col4, col5 = st.columns(5)
# Displays posters and titles in a row
```

---

## 🔥 Future Enhancements

- [ ] Async image fetching for faster poster loading
- [ ] Error handling for missing TMDb data
- [ ] Pagination for very large datasets
- [ ] Cloud-hosted model for scalability

---

## ⚠️ Notes

- `similarity.pkl` is a large file and is excluded from GitHub with `.gitignore`.
- You can use Google Drive or Git LFS to manage large binary files.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

## 🤝 Acknowledgments

- TMDb API for poster image support
- scikit-learn & NLTK for core ML components
