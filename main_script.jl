using CSV
using DataFrames
using Dates

main_list = CSV.read("main_list.csv", DataFrame)
daily_list = CSV.read("daily_list.csv", DataFrame)

main_list_updated = [main_list;daily_list]
main_list_deduplicated = unique(main_list_updated, 1)
CSV.write("main_list.csv", main_list_deduplicated)
print("Done! \n \n")

text = Vector{String}()
push!(text, string("Streak X: [Paganinikontraktet] by [Lars Kepler]\n\nSidor: /561\nNya ord: \n")) 
for i=1:nrow(daily_list)
    push!(text, string(daily_list[i, 1], " - ", daily_list[i,2], "\n"))
end
push!(text, string("\nSammanfattning:"))
text_finished = join(text)
print(text_finished)