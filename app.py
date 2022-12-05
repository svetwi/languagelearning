from flask import Flask, render_template, request, url_for

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")
    
@app.route("/study")
def study():
    return render_template("study.html")

@app.get("/forum")
def forum():
    return render_template("forum.html")

@app.post("/forum")
def forum_post():
    content = request.form.get("content", None)
    if content is None:
        return app.redirect("/forum")
    return render_template("forum.html", posts=[])

@app.route("/exercise")
def exercise():
    return render_template("exercise.html")

@app.route("/request")
def requests():
    return render_template("request.html")    