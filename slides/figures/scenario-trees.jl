# Scenario trees for lecture 13-2 (scenario trees and dynamic programming):
# - one year, where the grain price depends on the yield and the demand on the
#   price (the deck's `price_given_yield` and `demand_given_price`):
#   scenario-tree-one-year.svg
# - two years without memory, year 2's yield independent of year 1's:
#   scenario-tree-two-years-independent.svg
# - two years with memory, year 2's yield probabilities depending on year 1's
#   (the deck's `persistence` matrix): scenario-tree-two-years.svg
# Run from this folder: julia scenario-trees.jl

import Pkg
Pkg.activate(joinpath(@__DIR__, ".."))
using Plots
using Measures

plot_font = "Palatino Roman"
default(fontfamily=plot_font, linewidth=3, label=nothing, grid=false)
cb_vermillion = "#D55E00"

# Draw a scenario tree from left to right. Every node at stage t branches into
# the outcomes outcome_names[t]; outcome_probs[t][m] lists the probabilities of
# those outcomes from the m-th node of the stage before, so they can depend on
# the outcomes that led there. Above the tree, node_labels name what is decided
# at each column of nodes and branch_labels what is learned along each column
# of branches. Each branch is labelled with its outcome and probability: beside
# its middle (above a branch that rises or runs level, below one that falls),
# or to the right of the leaf in the last stage.
function draw_tree(outcome_names, outcome_probs, node_labels, branch_labels)
    n_stages = length(outcome_names)
    n_leaves = 1
    for t in 1:n_stages
        n_leaves = n_leaves * length(outcome_names[t])
    end
    top = n_leaves + 1.3
    p = plot(xlims=(-0.1, n_stages + 0.45), ylims=(0.5, top + 0.9), framestyle=:none,
        ticks=false)
    # column labels: decisions in black on the top row, uncertainties in
    # vermillion on the row below
    for t in 0:n_stages
        annotate!(p, t, top + 0.5, text(node_labels[t + 1], plot_font, 22, :center))
    end
    for t in 1:n_stages
        annotate!(p, t - 0.5, top - 0.4, text(branch_labels[t], plot_font, 22,
            cb_vermillion, :center))
    end
    # the root sits in the middle; a node covers a block of leaves, and sits
    # at the middle of its block (leaves are numbered from the top)
    parent_y = [(n_leaves + 1) / 2]
    scatter!(p, [0], parent_y, color=:black, markersize=9)
    n_nodes = 1
    for t in 1:n_stages
        k = length(outcome_names[t])
        n_nodes = n_nodes * k
        block = div(n_leaves, n_nodes)
        node_y = zeros(n_nodes)
        for j in 1:n_nodes
            node_y[j] = n_leaves + 1 - ((j - 1) * block + (block + 1) / 2)
            parent = div(j - 1, k) + 1
            outcome = mod(j - 1, k) + 1
            plot!(p, [t - 1, t], [parent_y[parent], node_y[j]], color=:gray50,
                linewidth=2)
            branch_text = outcome_names[t][outcome] * ", " *
                outcome_probs[t][parent][outcome]
            if t == n_stages
                annotate!(p, t + 0.04, node_y[j], text(branch_text, plot_font, 20,
                    cb_vermillion, :left))
            else
                # clear of the branch, farther for steeper branches
                mid_y = (parent_y[parent] + node_y[j]) / 2
                offset = 0.35 + 0.15 * abs(node_y[j] - parent_y[parent])
                if node_y[j] < parent_y[parent]
                    offset = -offset
                end
                annotate!(p, t - 0.5, mid_y + offset, text(branch_text, plot_font, 20,
                    cb_vermillion, :center))
            end
        end
        scatter!(p, fill(t, n_nodes), node_y, color=:black, markersize=9)
        parent_y = node_y
    end
    return p
end

# Two years. Year 1 is good, average or bad with probability 1/3 each; year 2
# leans toward the same kind of year as year 1, so its branch probabilities
# depend on which year 1 node they leave from.
yield_names = ["good", "average", "bad"]
p_years = draw_tree([yield_names, yield_names],
    [[["1/3", "1/3", "1/3"]],
     [["1/2", "1/3", "1/6"], ["1/3", "1/3", "1/3"], ["1/6", "1/3", "1/2"]]],
    ["plant", "buy, sell; plant again", "buy and sell"],
    ["year 1 yield", "year 2 yield"])
plot!(p_years, size=(1200, 460), margin=2mm)
savefig(p_years, joinpath(@__DIR__, "scenario-tree-two-years.svg"))

# One year: the yield, then the price, then the demand are learned in turn. A
# good harvest makes a low price more likely, and a low price makes high demand
# more likely, whatever the yield. Nothing is decided until all three are known.
p_one_year = draw_tree([yield_names, ["low", "high"], ["low", "high"]],
    [[["1/3", "1/3", "1/3"]],
     [["2/3", "1/3"], ["1/2", "1/2"], ["1/3", "2/3"]],
     [["1/3", "2/3"], ["2/3", "1/3"], ["1/3", "2/3"], ["2/3", "1/3"],
      ["1/3", "2/3"], ["2/3", "1/3"]]],
    ["plant", "", "", "buy and sell"],
    ["yield", "price", "demand"])
plot!(p_one_year, size=(1200, 560), margin=2mm)
savefig(p_one_year, joinpath(@__DIR__, "scenario-tree-one-year.svg"))

# Two years without memory: year 2's probabilities are the same after every
# year 1 yield.
p_independent = draw_tree([yield_names, yield_names],
    [[["1/3", "1/3", "1/3"]],
     [["1/3", "1/3", "1/3"], ["1/3", "1/3", "1/3"], ["1/3", "1/3", "1/3"]]],
    ["plant", "buy, sell; plant again", "buy and sell"],
    ["year 1 yield", "year 2 yield"])
plot!(p_independent, size=(1200, 460), margin=2mm)
savefig(p_independent, joinpath(@__DIR__, "scenario-tree-two-years-independent.svg"))
