function fish_func
    # # general syntax
    # bass command ';'
    # bass source filename.sh ';' bash_function_asvariables arguments[]
    bass source example.sh ';' bash_func $argv
    echo "exiting fish shell"
end