mkdir -p ~/.streamlit/

echo "\
[server]\n\
port = $PORT\n\
enableCORS = flase\n\
headless = true\n\
" > ~/.streamlit/config.toml