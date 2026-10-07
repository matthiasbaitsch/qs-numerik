# Files to be included in the zipfile in addition to notebooks and source files
const extrafiles = ["Project.toml", "pyproject.toml", ".python-version"]

# Notebook metadata such that Jupyter and VS Code choose a kernel for the right language
const metadata = Dict(
    "julia" => """{"language_info": {"name": "julia"}}""",
    "python" => """{"kernelspec": {"display_name": "Python 3", "language": "python", "name": "python3"}, "language_info": {"name": "python"}}"""
)

# Replace top level metadata of notebook (it comes after the cells and before nbformat)
function setmetadata(path, lang)
    s = read(path, String)
    i = findlast("\"metadata\": {", s)
    j = findnext("\"nbformat\"", s, last(i))
    write(path, s[1:first(i)-1] * "\"metadata\": $(metadata[lang]),\n " * s[first(j):end])
end

for lang = ARGS

    # Language
    input_dir = "skript-$lang"
    output_dir = "_build/$lang"
    name = "$lang-und-jupyter-notebooks"
    project_dir = "$output_dir/zip/$name"
    ext = (lang == "julia" ? ".jl" : ".py")

    # Create folders
    mkpath(project_dir)

    # Convert qmd files and copy other files and pics folder
    for o = readdir(input_dir)
        if o ∉ ["index.qmd", "installation.qmd"] && endswith(o, ".qmd")
            p = replace(o, ".qmd" => ".ipynb")
            run(`quarto convert $input_dir/$o --output $project_dir/$p`)
            setmetadata("$project_dir/$p", lang)
        elseif endswith(o, ext) || endswith(o, ".code-workspace") || o ∈ extrafiles
            cp("$input_dir/$o", "$project_dir/$o")
        end
    end
    isdir("$input_dir/pics") && cp("$input_dir/pics", "$project_dir/pics")

    # Copy assignments
    cp("aufgaben/aufgaben.ipynb", "$project_dir/aufgaben.ipynb")
    setmetadata("$project_dir/aufgaben.ipynb", lang)

    # Create zipfile (zip would otherwise add to an existing one)
    rm("$output_dir/$name.zip", force=true)
    cd("$output_dir/zip") do
        run(`zip -r ../$name.zip $name`)
    end

    # Delete zip-folder
    rm("$output_dir/zip", recursive=true)
end
