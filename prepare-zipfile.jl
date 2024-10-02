for lang ∈ ARGS

    # Language
    input_dir = "skript-$lang"
    output_dir = "_build/$lang"
    ext = (lang == "julia" ? ".jl" : ".py")

    # Remove output dir
    rm(output_dir, recursive=true, force=true)

    # Create folders
    mkpath("$output_dir/zip")

    # Convert qmd files and copy pics folder
    for o = readdir(input_dir)
        if o != "index.qmd" && endswith(o, ".qmd")
            p = replace(o, ".qmd" => ".ipynb")
            run(`quarto convert $input_dir/$o --output $output_dir/zip/$p`)
        elseif endswith(o, ext)
            cp("$input_dir/$o", "$output_dir/zip/$o")
        end
    end
    isdir("$input_dir/pics") && cp("$input_dir/pics", "$output_dir/zip/pics")

    # Create zipfile
    cd("$output_dir/zip")
    run(`zip -r ../$lang-und-jupyter-notebooks.zip .`)
    cd("../../..")

    # Delete zip-folder
    rm("$output_dir/zip", recursive=true)
end