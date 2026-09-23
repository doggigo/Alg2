typst compile "./cours.typ" "./cours-only-thms.pdf"  --input only-thms=true --input theme=colors 
typst compile "./cours.typ" "./cours.pdf" --input theme=colors
typst compile "./cours.typ" "./cours-only-thms-bw.pdf" --input only-thms=true --input theme=bw
typst compile "./cours.typ" "./cours-bw.pdf" --input theme=bw
echo "Documents compilés avec succès"