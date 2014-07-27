# tree2.rb


class Tree
	attr_accessor :children, :node_name
	def initialize(nodes)
		nodes.take_while do |node|
			@node_name	= node[0]
			@children	= node[1].inject([]) do |children,child|
				children.push(Tree.new({child[0] => child[1]}))
			end
			false # we're only expecting one node; ignore rest
		end
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end

end


family = {
	"Liz" => {
		"Adam" => {
			"Zachary"=>{}
		},
		"Stephanie" => {
			"Tori" => {}
		},
		"Amy" => {
			"Leo" => {},
			"Jasper" => {},
			"Cooper" => {},
			"India-Rose" => {}
		},
		"Katie" => {
			"Lola" => {},
			"Lucy" => {}
		}
	},
	"Donald" => { # we're gonna ignore the second node
		"Mark" => {"Fleur"=>{}},
		"Fiona"=> {},
		"Adam" => {"Zachary"=>{}}
	}
}

familyTree = Tree.new(family)

familyTree.visit {|node| puts node.node_name}
puts "============"
puts
familyTree.visit_all {|node| puts node.node_name}
