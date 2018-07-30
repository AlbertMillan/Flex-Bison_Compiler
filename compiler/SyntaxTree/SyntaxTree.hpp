#pragma once
#include <vector>


namespace compiler
{
	class SyntaxTree
	{
	public:
		SyntaxTree();
		virtual ~SyntaxTree();

		virtual std::string toCode() const = 0;

	private:

		std::vector<std::unique_ptr<SyntaxTree>> children;
	};

}