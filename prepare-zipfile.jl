for lang ∈ ARGS

    # Folders
    input_dir = "skript-$lang"
    output_dir = "_build/$lang"

    # Create folders
    mkpath("$output_dir/skript")
    mkpath("$output_dir/zip")

    # Convert qmd files and copy pics folder
    for o = readdir(input_dir)
        if o != "index.qmd" && endswith(o, ".qmd")
            p = replace(o, ".qmd" => ".ipynb")
            run(`quarto convert $input_dir/$o --output $output_dir/zip/$p`)
        end
    end
    isdir("$input_dir/pics") && cp("$input_dir/pics", "$output_dir/zip/pics", force=true)

    # Create zipfile
    cd("$output_dir/zip")
    run(`zip -qq -r ../$lang-und-jupyter-notebooks.zip .`)
    cd("../..")

    # Delete zip-folder
end