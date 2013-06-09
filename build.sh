# Renaming argument
current_file=$1;

# Your CS version
version="CS6";

# Full path
full_path="/Applications/Adobe After Effects ${version}/Scripts/${current_file%.*}.jsx";


# Copying built file to script folder
cp $current_file "${full_path}";

file_compiled=$(sed -i.bak "s/#include \"\(.*\)\";/$(cat \1)/g" "${full_path}")

# Printing happy feedback in the console
echo "Successfully compiled ${current_file} to ${full_path}";